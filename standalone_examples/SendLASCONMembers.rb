class LASCONMember
	def initialize(badge_id, data_source)
		@id = badge_id
		@data_source = data_source
	end

	def attendee
		info = @data_source.get_attendee_info(@id)
		name = @data_source.get_attendee_name(@id)
		badge_color = @data_source.get_attendee_color(@id)
		shirt_size = @data_source.get_attendee_size(@id)
	end

	def speaker
		info = @data_source.get_speaker_info(@id)
		name = @data_source.get_speaker_name(@id)
		badge_color = @data_source.get_speaker_color(@id)
		shirt_size = @data_source.get_speaker_size(@id)
	end

	def adminisrator
		info = @data_source.get_administrator_info(@id)
		name = @data_source.get_administrator_name(@id)
		badge_color = @data_source.get_administrator_color(@id)
		shirt_size = @data_source.get_administrator_size(@id)
	end
end

member = LASCONMember.new(1, "Checked-In")

class LASCONMember
	def initialize(badge_id, data_source)
		@id = badge_id
		@data_source = data_source
	end

	def attendee
		att_type :attendee
	end

	def speaker
		att_type :speaker
	end

	def administrator
		att_type :administrator
	end

	def att_type(name)
		info = @data_source.send("get_#{name}_info"), @id
		name = @data_source.send("get_#{name}_name"), @id
		badge_color = @data_source.send("get_#{name}_color"), @id
		shirt_size = @data_source.send("get_#{name}_size"), @id
	end
end