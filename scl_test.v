module scalafile

// test reading a valid scale
fn test_read_good_scl() ? {
	s := read_scl(good_scl_file.to_string()) ?
	assert s == ref_scale
}

// test reading an invalid scale
fn test_read_bad_scl() ? {
	if _ := read_scl(bad_file.to_string()) {
		return error('expected error')
	} else {
		assert err == error('error in file format')
	}
}

// test writing a scale
fn test_write_scl() {
	assert ref_scale.write() == good_scl_file.to_string()
}
