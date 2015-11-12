# ID3dit

[ID3](https://en.wikipedia.org/wiki/ID3) tags editor for the command line written in Ruby.

## Usage

### Print Help

	id3dit -h

### Interactive Mode

	id3dit FILES...

### Set Tag

	id3dit --artist STRING FILES...

### Remove All Tags

	id3dit --remove-all FILES...

### Remove a Tag

	id3dit --remove-comment FILES...

### Examples

- `id3dit my_music.mp3`
- `id3dit track01.mp3 track02.mp3`
- `id3dit --artist EAV track01.mp3`
- `id3dit --artist AC/DC *.mp3`
- `id3dit --year 1987 --bpm 180 track01.mp3`
- `id3dit --remove-all track01.mp3`
- `id3dit --remove-comment track01.mp3 track02.mp3`
- `id3dit --remove-disc --remove-track track01.mp3 track02.mp3`

## License
Copyright (C) 2015 Christian Mayer <http://fox21.at>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
