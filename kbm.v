module scalafile

import strconv { atof64, atoi }

// KeyboardMap represents a Scala keyboard map.
// Unused keys in the mapping are converted to -1.
pub struct KeyboardMap {
pub mut:
	filename      string
	size          int
	first_note    int
	last_note     int
	middle_note   int
	ref_note      int
	ref_freq      f64
	octave_degree int
	mapping       []int
}

// read_kbm reads a KeyboardMap from .kbm-formatted text.
pub fn read_kbm(text string) ?KeyboardMap {
	mut values_read := 0
	mut k := KeyboardMap{}
	for i, mut line in text.split_into_lines() {
		line = line.trim(' ')
		if line.starts_with('!') {
			if i == 0 && line.len > 1 {
				k.filename = line.substr(1, line.len).trim(' ')
			}
		} else {
			match values_read {
				0 {
					k.size = atoi(line) ?
				}
				1 {
					k.first_note = atoi(line) ?
				}
				2 {
					k.last_note = atoi(line) ?
				}
				3 {
					k.middle_note = atoi(line) ?
				}
				4 {
					k.ref_note = atoi(line) ?
				}
				5 {
					// atof64 doesn't return errors…
					k.ref_freq = atof64(line)
				}
				6 {
					k.octave_degree = atoi(line) ?
				}
				else {
					if line == 'x' {
						k.mapping << -1
					} else {
						k.mapping << atoi(line) ?
					}
				}
			}
			values_read++
		}
	}
	return k
}

// write writes .kbm-formatted text from a KeyboardMap.
pub fn (k KeyboardMap) write() string {
	mut lines := []string{}
	lines << '! $k.filename'
	lines << k.size.str()
	lines << k.first_note.str()
	lines << k.last_note.str()
	lines << k.middle_note.str()
	lines << k.ref_note.str()
	lines << k.ref_freq.str()
	lines << k.octave_degree.str()
	for v in k.mapping {
		lines << if v == -1 { 'x' } else { v.str() }
	}
	lines << ''
	return lines.join('\r\n')
}
