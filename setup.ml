(* Store original attributes *)
let attr_orig =
	Unix.tcgetattr Unix.stdin

(* Modify stdin so that keystrokes are processed immediately *)
(* Also ensure key input is not echoed *)
let setup_stdin () =
	let attr =
		{ attr_orig with c_icanon = false
		; c_echo = false
		}
	in
	Unix.(tcsetattr stdin TCSANOW attr)
