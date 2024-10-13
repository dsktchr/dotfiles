export-env { 
    $env.config = (
        {
            ...$env.config,
            show_banner: true # true or false to enable or disable the welcome banner at startup

            ls: {
                use_ls_colors: true # use the LS_COLORS environment variable to colorize output
                clickable_links: true # enable or disable clickable links. Your terminal has to support links.
            }

            rm: {
                always_trash: false # always act as if -t was given. Can be overridden with -p
            }

            table: {
                mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
                index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
                show_empty: true # show 'empty list' and 'empty record' placeholders for command output
                padding: { left: 1, right: 1 } # a left right padding of each column in a table
                trim: {
                    methodology: wrapping # wrapping or truncating
                    wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
                    truncating_suffix: "..." # A suffix used by the 'truncating' methodology
                }
                header_on_separator: false # show header text on separator/border line
                # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
            }

            error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

            # Whether an error message should be printed if an error of a certain kind is triggered.
            display_errors: {
                exit_code: false # assume the external command prints an error message
                # Core dump errors are always printed, and SIGPIPE never triggers an error.
                # The setting below controls message printing for termination by all other signals.
                termination_signal: true
            }

            # datetime_format determines what a datetime rendered in the shell would look like.
            # Behavior without this configuration point will be to "humanize" the datetime display,
            # showing something like "a day ago."
            datetime_format: {
                # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
                # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
            }

            explore: {
                status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
                command_bar_text: { fg: "#C4C9C6" },
                highlight: { fg: "black", bg: "yellow" },
                status: {
                    error: { fg: "white", bg: "red" },
                    warn: {}
                    info: {}
                },
                selected_cell: { bg: light_blue },
            }

            history: {
                max_size: 100_000 # Session has to be reloaded for this to take effect
                sync_on_enter: false # Enable to share history between multiple sessions, else you have to close the session to write history to file
                file_format: "plaintext" # "sqlite" or "plaintext"
                isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
            }

            filesize: {
                metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
                format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
            }

            cursor_shape: {
                emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
                vi_insert: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
                vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
            }
        }
    )
}
