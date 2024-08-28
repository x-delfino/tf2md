include "common" {"search": "./"}; 

def print_table: . | "| Severity | Count |\n| -------- | ----- | \n| Warning  | \(.warning_count)     |\n| Error    | \(.error_count)     |\n\n";

. | "\(print_table, process_diagnostic)"