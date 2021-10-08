module scalafile

// as of V 0.2.4 60add6c, putting these in scl_test.v causes `v fmt` to add the
// module prefix to the identifiers, which are then reported as undefined by `v
// test`.

const (
	bad_file      = $embed_file('testdata/error.scl')

	good_scl_file = $embed_file('testdata/meanquar.scl')
	ref_scale     = Scale{
		filename: 'meanquar.scl'
		description: "1/4-comma meantone scale. Pietro Aaron's temperament (1523)"
		notes: [
			Ratio{7604900, 100000},
			Ratio{19315686, 100000},
			Ratio{31026471, 100000},
			Ratio{5, 4},
			Ratio{50342157, 100000},
			Ratio{57947057, 100000},
			Ratio{69657843, 100000},
			Ratio{25, 16},
			Ratio{88973529, 100000},
			Ratio{100684314, 100000},
			Ratio{108289214, 100000},
			Ratio{2, 1},
		]
	}

	good_kbm_file    = $embed_file('testdata/example.kbm')
	ref_keyboard_map = KeyboardMap{
		filename: 'example.kbm'
		size: 12
		first_note: 0
		last_note: 127
		middle_note: 60
		ref_note: 69
		ref_freq: 440.1
		octave_degree: 12
		mapping: [
			0,
			1,
			2,
			3,
			-1,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
		]
	}
)
