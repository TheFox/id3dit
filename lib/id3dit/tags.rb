
require 'id3dit/version'

module ID3dit
	
	class Tags < Hash
		attr_accessor :raw
		
		def initialize(tags)
			@raw = USED_TAGS.map{ |tag_name, tag|
				[tag_name, {
					:old_value => nil,
					:new_value => nil,
					:has_init => false,
					:is_mixed => false,
					:is_removed => false,
					:has_changed => false,
				}] }.to_h
				
			tags.each do |tag|
				@raw.each do |tag_name, tag_infos|
					field = tag.send(tag_name)
					
					if tag_infos[:has_init]
						if !tag_infos[:is_mixed]
							if field != tag_infos[:old_value]
								tag_infos[:is_mixed] = true
								tag_infos[:old_value] = nil
								tag_infos[:new_value] = nil
							end
						end
					else
						tag_infos[:has_init] = true
						tag_infos[:old_value] = field
					end
				end
			end
		end
		
		def [](key)
			@raw[key]
		end
		
		def []=(key, val)
			tag = @raw[key]
			tag[:has_changed] = true
			tag[:has_init] = true
			tag[:is_removed] = false
			tag[:new_value] = val
		end
		
		def delete(key)
			tag = @raw[key]
			tag[:has_changed] = true
			tag[:is_removed] = true
		end
		
		def are_inited
			@raw.select{ |tag_name, tag_infos| tag_infos[:has_init] }
		end
		
		def have_changed
			are_inited.select{ |tag_name, tag_infos| tag_infos[:has_changed] }
		end
		
		def are_unchanged
			are_inited.select{ |tag_name, tag_infos| !tag_infos[:has_changed] }
		end
		
		def have_no_old_value
			are_unchanged.select{ |tag_name, tag_infos| tag_infos[:old_value].nil? }
		end
		
		def are_set
			are_inited.select{ |tag_name, tag_infos|
				!tag_infos[:old_value].nil? ||
				!tag_infos[:new_value].nil? ||
				tag_infos[:is_mixed] ||
				tag_infos[:has_changed]
			}
		end
		
		def are_set?
			are_set.count > 0
		end
		
		def are_not_removed
			are_inited.select{ |tag_name, tag_infos| !tag_infos[:is_removed] }
		end
		
		def are_for_edit
			are_not_removed.select{ |tag_name, tag_infos|
				!tag_infos[:old_value].nil? ||
				tag_infos[:has_changed] ||
				tag_infos[:is_mixed]
			}
		end
		
		def are_for_further_edit
			have_no_old_value.select{ |tag_name, tag_infos| !tag_infos[:is_mixed] }
		end
		
		def are_for_remove
			are_not_removed.select{ |tag_name, tag_infos|
				!tag_infos[:old_value].nil? ||
				!tag_infos[:new_value].nil? ||
				tag_infos[:is_mixed]
			}
		end
		
		def update
			have_changed.each do |tag_name, tag_infos|
				# Set tag infos to default.
				tag_infos[:old_value] = tag_infos[:is_removed] ? nil : tag_infos[:new_value]
				tag_infos[:new_value] = nil
				# tag_infos[:has_init] = false
				tag_infos[:is_mixed] = false
				tag_infos[:is_removed] = false
				tag_infos[:has_changed] = false
			end
		end
		
	end
	
end
