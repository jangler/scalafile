module scalafile

// test reading a valid scale
fn test_read() ? {
	s := read_scale(good_file.to_string()) ?
	assert s == ref_scale
}

// test reading an invalid scale
fn test_read_error() ? {
	if _ := read_scale(bad_file.to_string()) {
		return error('expected error')
	} else {
		assert err == error('error in file format')
	}
}

// test writing a scale
fn test_write() {
	assert ref_scale.write() == good_file.to_string()
}
