let backup_create file write = 
  match write with
  | true -> FileUtil.cp [file] (file ^ ".bak")
  | false -> ()

let backup_remove file write = 
  match write with
  | true -> FileUtil.rm [file ^ ".bak"]
  | false -> ()

let cpcfmt_file write file =
  let () = backup_create file write in
  let ch = open_in file in 
  let () = close_in ch in
  backup_remove file write