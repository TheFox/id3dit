
module ID3dit
	VERSION = '1.2.0-dev.1'
	DATE = '2015-12-07'
	HOMEPAGE = 'https://github.com/TheFox/id3dit'
	USED_TAGS = {
		:title => {:id => :TIT2},
		:artist => {:id => :TPE1},
		:composer => {:id => :TCOM},
		:year => {:id => :TYER},
		:genre => {:id => :TCON},
		:bpm => {:id => :TBPM},
		:grouping => {:id => :TIT1},
		:comment => {:id => :COMM},
		:album => {:id => :TALB},
		:band => {:id => :TPE2},
		:disc => {:id => :TPOS},
		:track => {:id => :TRCK},
	}
end
