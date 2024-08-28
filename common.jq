def strip_string: . | ltrimstr("\n") | ltrimstr(" ") | ltrimstr("- ");
def status_icon: . | "\(if . == "error" then ":x:" elif . == "warn" or . == "warning" then ":warning:" elif . == "info" then ":grey_exclamation:" else . end)";
def action_icon: . | "\(if . == "create" then ":heavy_plus:"  elif . == "read" then ":book:"  elif . == "noop" then ":heavy_minus_sign:"  elif . == "update" then ":wrench:"  elif . == "replace" then ":recycle:"  elif . == "delete" then ":bomb:"  elif . == "move" then ":truck:"  elif . == "import" then ":arrow_heading_down:" else . end)";
def process_diagnostic: .diagnostics // [.diagnostic]| sort_by(.severity)[] | "<details>\n  <summary>\n    \(.severity | status_icon) \(.summary)\n  </summary>\n  \(.detail)\n\n \($ENV.GH_TF_FULL_PATH)\(.range.filename)#L\(.range.start.line)-L\(.range.end.line) \n</details>\n\n";