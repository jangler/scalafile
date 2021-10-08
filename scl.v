module scalafile

import strconv { atoi }
import math

// Scale represents a Scala scale.
pub struct Scale {
pub mut:
	filename    string
	description string
	notes       []Ratio
}

// ScaleReadState is used to track the stage of reading a .scl file.
enum ScaleReadState {
	description
	count
	notes
}

// read_scl reads a Scale from .scl-formatted text.
pub fn read_scl(text string) ?Scale {
	mut s := Scale{}
	mut nremaining := 0
	mut state := ScaleReadState.description
	for i, line in text.split_into_lines() {
		if line.starts_with('!') {
			if i == 0 && line.len > 1 {
				s.filename = line.substr(1, line.len).trim(' ')
			}
		} else {
			match state {
				.description {
					s.description = line
					state = .count
				}
				.count {
					nremaining = atoi(line.trim(' ')) ?
					state = .notes
				}
				.notes {
					if nremaining > 0 {
						s.notes << parse_ratio(line.trim(' ')) ?
						nremaining -= 1
					}
				}
			}
		}
	}
	if state == .notes && nremaining == 0 {
		return s
	}
	return error('error in file format')
}

// write writes .scl-formatted text from a Scale.
pub fn (s Scale) write() string {
	mut lines := []string{}
	lines << '! $s.filename'
	lines << '!'
	lines << s.description
	lines << ' $s.notes.len'
	lines << '!'
	for note in s.notes {
		lines << ' $note'
	}
	lines << ''
	return lines.join('\r\n')
}

// Ratio represents a rational number.
pub struct Ratio {
pub mut:
	n i64
	d i64
}

// parse_ratio parses a string into a Ratio.
fn parse_ratio(s string) ?Ratio {
	mut r := Ratio{1, 1}
	if s.contains('/') {
		tokens := s.split('/')
		r.n = atoi(tokens[0]) ?
		r.d = atoi(tokens[1]) ?
	} else if s.contains('.') {
		r.n = atoi(s.replace('.', '')) ?
		r.d = i64(math.pow(10, s.len - s.index_any('.') - 1))
	} else {
		r.n = atoi(s) ?
	}
	return r
}

// str formats a Ratio as a string.
fn (r Ratio) str() string {
	if r.d != 1 {
		decimal_places := math.log10(r.d)
		if math.fmod(decimal_places, 1) == 0 {
			s := r.n.str()
			i := s.len - int(decimal_places)
			return s.substr(0, i) + '.' + s.substr(i, s.len)
		}
	}
	return '$r.n/$r.d'
}
