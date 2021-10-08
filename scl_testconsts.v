module scalafile

// as of V 0.2.4 60add6c, putting these in scl_test.v causes `v fmt` to add the
// module prefix to the identifiers, which are then reported as undefined by `v
// test`.

const (
	good_file = $embed_file('testdata/meanquar.scl')
	bad_file  = $embed_file('testdata/error.scl')
	ref_scale = Scale{
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
)
