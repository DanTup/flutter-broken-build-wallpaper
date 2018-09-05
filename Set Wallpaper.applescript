-- Save the file as an "Application" and tick "Stay open after run handler"

on idle
	
	set tmpFile to "/tmp/flutter_latest_build_status"
	tell application "Finder" to set script_dir to container of (path to me) as text
	set red_picture to script_dir & "Red.png"
	
	do shell script "/usr/bin/curl https://flutter-dashboard.appspot.com/api/public/build-status > " & tmpFile
	set res to read POSIX file tmpFile
	
	tell application "System Events" to tell every desktop
		if "Fail" is in res then
			set picture to red_picture
		else
			set picture to {"Macintosh HD:Library:Desktop Pictures:Yosemite 5.jpg"}
		end if
	end tell
	
	return 120
	
end idle