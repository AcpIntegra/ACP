if [ "$CONFIGURATION" == "Debug-annals" ] || [ "$CONFIGURATION" == "Release-annals" ]; then
  cp Runner/annals/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-aimcc" ] || [ "$CONFIGURATION" == "Release-aimcc" ]; then
  cp Runner/aimcc/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-guidelines" ] || [ "$CONFIGURATION" == "Release-guidelines" ]; then
  cp Runner/guidelines/GoogleService-Info.plist Runner/GoogleService-Info.plist
fi

