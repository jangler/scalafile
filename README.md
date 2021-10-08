# scalafiles

[V](https://vlang.io) library for reading and writing
[Scala](http://www.huygens-fokker.org/scala/)
[.scl](http://www.huygens-fokker.org/scala/scl_format.html) and
[.kbm](http://www.huygens-fokker.org/scala/help.htm#mappings) files.

## Contents
- [read_kbm](#read_kbm)
- [read_scl](#read_scl)
- [KeyboardMap](#KeyboardMap)
  - [write](#write)
- [Ratio](#Ratio)
- [Scale](#Scale)
  - [write](#write)

## read_kbm
```v
fn read_kbm(text string) ?KeyboardMap
```

read_kbm reads a KeyboardMap from .kbm-formatted text.  

[[Return to contents]](#Contents)

## read_scl
```v
fn read_scl(text string) ?Scale
```

read_scl reads a Scale from .scl-formatted text.  

[[Return to contents]](#Contents)

## KeyboardMap
```v
struct KeyboardMap {
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
```

KeyboardMap represents a Scala keyboard map.  
Unused keys in the mapping are converted to -1.  

[[Return to contents]](#Contents)

## write
```v
fn (k KeyboardMap) write() string
```

write writes .kbm-formatted text from a KeyboardMap.  

[[Return to contents]](#Contents)

## Ratio
```v
struct Ratio {
pub mut:
	n i64
	d i64
}
```

Ratio represents a rational number.  

[[Return to contents]](#Contents)

## Scale
```v
struct Scale {
pub mut:
	filename    string
	description string
	notes       []Ratio
}
```

Scale represents a Scala scale.  

[[Return to contents]](#Contents)

## write
```v
fn (s Scale) write() string
```

write writes .scl-formatted text from a Scale.  

[[Return to contents]](#Contents)
