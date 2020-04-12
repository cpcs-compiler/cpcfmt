open Cmdliner

let version = "v0.1"

let cpcfmt write rule src =
  let () = match rule with
    | Some str -> print_endline str
    | None -> print_newline ()
  in
  let () = Printf.printf "%B\n" write in
  List.map print_endline src

let src = Arg.(non_empty & pos_all file [] & info [] ~docv:"FILE")

let write =
  let doc = "Do not print reformatted sources to standard output. If a file's formatting is different from cpcfmt's, overwrite it with cpcfmt's version. If an error occured during overwriting, the original file is restored from an automatic backup." in
  Arg.(value & flag & info ["w"] ~doc)

let rule =
  let doc = "Apply the rewrite rule to the source before reformatting" in
  Arg.(value & opt (some string) None & info ["r"] ~docv:"RULE" ~doc)

let cmd =
  let doc = "CC+ formater" in
  let sdocs = Manpage.s_common_options in
  let exits = Term.default_exits in
  Term.(const cpcfmt $ write $ rule $ src),
  Term.info "cpcfmt" ~version ~doc ~sdocs ~exits

let () = Term.(exit @@ eval cmd)