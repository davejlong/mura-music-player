# Mura Music Player

The Mura Music Player is a Mura plugin that uses [23rd & Walnut's Fullscreen Media Player](http://codecanyon.net/item/fullscreen-music-player/106710?ref=23andwalnut).  To use the plugin you must purchase a license for the Fullscreen Media Player from [CodeCanyon](http://codecanyon.net/item/fullscreen-music-player/106710?ref=23andwalnut).

## License
![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)

Mura Music Player by [David Long](http://www.davejlong.com) is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).


## Installing Fullscreen Media Player
After [buying](http://codecanyon.net/item/fullscreen-music-player/106710?ref=23andwalnut), downloading and unzipping the music player you must copy the directories as follows:

- **{SOURCE}** - **{TARGET}**
- css/style.css - assets/css/style.css
- images/\* -assets/ images/\*
- js/openMediaPlayer-min.js - assets/js/openMediaPlayer-min.js
- js/ttwFullScreenMusic.js - assets/js/ttwFullScreenMusic.js

## Using Mura Music Player
Mura Music Player is very easy to use out of the box.  On a content page page that you want to put a playlist create an unordered list of links to media files.  Also works in components.  For example:

	<ul class="playlist">
		<li><a href="/default/assets/Music/To_The_Trees/01_The_Hitchhiker.mp3">The Hitchhiker</a></li>
		<li><a href="/default/assets/Music/To_The_Trees/02_My_Harmony.mp3">My Harmony</a></li>
	</ul>

## Changeset

- 1.0.25 - Ability to create a playlist in content editor for Site Manager and Components Manager

## Future Releases

-2.0 - Functionality to create reusable playlists in an administration tool.
