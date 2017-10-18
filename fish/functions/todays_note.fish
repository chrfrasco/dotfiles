function todays_note
  set todays_note_dir (date "+$HOME/Dropbox/daily_notes/%Y/%b/")
  set todays_filename (date '+%A-%d.md')

  if not test -d $todays_note_dir
    mkdir -p $todays_note_dir
  end

  pushd $todays_note_dir; and nvim $todays_filename; and popd
end

