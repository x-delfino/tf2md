include "common" {"search": "./"}; 

def print_diagnostics: .diagnostics | sort_by(.severity)[] | "<details>\n  <summary>\n    \(.severity | status_icon) \(.summary)\n  </summary>\n  \(.detail)\n\n  ${{github.server_url}}/${{github.repository}}/blob/${{github.sha}}/${{inputs.tf-path}}\(.range.filename)#L\(.range.start.line)C\(.range.start.column)-L\(.range.end.line)C\(.range.end.column) \n</details>\n\n";
def print_table: . | "| Severity | Count |\n| -------- | ----- | \n| Warning  | \(.warning_count)     |\n| Error    | \(.error_count)     |\n\n";

. | "\(print_table, print_diagnostics)"