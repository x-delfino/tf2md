include "common" {"search": "./"}; 

def process_generic: . | select(.["@message"]!="") | "\(.["@level"] | status_icon) \(.["@message"] | strip_string )";
def process_planned_change: . | "\(.["change"].["action"] | action_icon) \(.["change"].["action"]) \(.["change"].["resource"].["addr"]) \(.["change"].["reason"] | if . != null then . else "" end )";

def process_message: . | if .["type"] == "planned_change" then (. | process_planned_change) else (. | process_generic) end;

sort_by(".@timestamp")[] | process_message