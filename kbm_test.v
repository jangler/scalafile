module scalafile

// test reading a valid keyboard map
fn test_read_good_kbm() ? {
	k := read_kbm(good_kbm_file.to_string()) ?
	assert k == ref_keyboard_map
}

// test reading an invalid keyboard map
fn test_read_bad_kbm() ? {
	if _ := read_kbm(bad_file.to_string()) {
		return error('expected error')
	} else {
		// do nothing
	}
}

// test writing a keyboard map
fn test_write_kbm() {
	assert strip_comments(ref_keyboard_map.write()) == strip_comments(good_kbm_file.to_string())
}

// strips comment lines from a string
fn strip_comments(s string) string {
	return s.split_into_lines().filter(fn (l string) bool {
		return !l.starts_with('!')
	}).join('\r\n')
}
