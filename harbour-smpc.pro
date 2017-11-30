# The name of your app
TARGET = harbour-smpc

QT += network gui sql multimedia svg
QT += gui

CONFIG += sailfishapp


# C++ sources
SOURCES += main.cpp \
#    src/localdb/qmlimageprovider.cpp \
#    src/localdb/lastfmartistprovider.cpp \
#    src/localdb/lastfmalbumprovider.cpp \
#    src/localdb/imagedownloader.cpp \
#    src/localdb/imagedatabase.cpp \
#    src/localdb/databasefilljob.cpp \
#    src/localdb/artistinformation.cpp \
#    src/localdb/albuminformation.cpp \
    src/mpd/serverprofile.cpp \
    src/mpd/playlistmodel.cpp \
    src/mpd/networkaccess.cpp \
    src/mpd/mpdtrack.cpp \
    src/mpd/mpdoutput.cpp \
    src/mpd/mpdfileentry.cpp \
    src/mpd/mpdartist.cpp \
    src/mpd/mpdalbum.cpp \
    src/mpd/filemodel.cpp \
    src/mpd/artistmodel.cpp \
    src/mpd/albummodel.cpp \
    src/controller.cpp \
    src/streamplayer.cpp \
    src/mpd/serverprofilemodel.cpp \
    src/mpd/mpdplaybackstatus.cpp \
    src/mpd/serverinfo.cpp

# C++ headers
HEADERS += \
    src/controller.h \
    src/mpd/serverprofile.h \
    src/mpd/playlistmodel.h \
    src/mpd/networkaccess.h \
    src/mpd/mpdtrack.h \
    src/mpd/mpdoutput.h \
    src/mpd/mpdfileentry.h \
    src/mpd/mpdartist.h \
    src/mpd/mpdalbum.h \
    src/mpd/filemodel.h \
    src/mpd/artistmodel.h \
    src/mpd/albummodel.h \
    src/common.h \
    src/streamplayer.h \
    src/mpd/serverprofilemodel.h \
    src/mpd/mpdplaybackstatus.h \
    src/mpd/mpdcommon.h \
    src/mpd/serverinfo.h

DISTFILES =     translations/*.ts \
    rpm/harbour-smpc.yaml \
    rpm/harbour-smpc.spec \
    qml/pages/database/SongPage.qml \
    qml/pages/database/SearchPage.qml \
    qml/pages/database/SavedPlaylistsPage.qml \
    qml/pages/database/PlaylistTracksPage.qml \
    qml/pages/database/FileBrowserPage.qml \
    qml/pages/database/CurrentSong.qml \
    qml/pages/database/CurrentPlaylistPage.qml \
    qml/pages/database/CurrentPlaylistPage_large.qml \
    qml/pages/database/ArtistListPage.qml \
    qml/pages/database/ArtistInformationPage.qml \
    qml/pages/database/ArtistInfoPage.qml \
    qml/pages/database/AlbumTracksPage.qml \
    qml/pages/database/AlbumListPage.qml \
    qml/pages/database/AlbumInfoPage.qml \
    qml/pages/database/AddToPlaylistDialog.qml \
    qml/pages/database/CurrentPlaylistPage_large.qml \
    qml/pages/database/CurrentSong_large.qml \
    qml/pages/settings/SettingsPage.qml \
    qml/pages/settings/ServerListPage.qml \
    qml/pages/settings/ServerEditPage.qml \
    qml/pages/settings/OutputsPage.qml \
    qml/pages/settings/DatabaseSettings.qml \
    qml/pages/settings/ConnectServerPage.qml \
    qml/pages/settings/AboutPage.qml \
    qml/pages/settings/GUISettings.qml \
    qml/main.qml \
    qml/pages/MainPage.qml \
    qml/cover/CoverPage.qml \

include(common/common.pri)
#message($$DISTFILES)
# to disable building translations every time, comment out the
# following CONFIG line
#CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/$${TARGET}_de.ts
TRANSLATIONS += translations/$${TARGET}_fr.ts

RESOURCES +=  miscresources.qrc

#DEFINES += QT_USE_FAST_CONCATENATION QT_USE_FAST_OPERATOR_PLUS QT_NO_DEBUG_OUTPUT
DEFINES += QT_USE_FAST_CONCATENATION QT_USE_FAST_OPERATOR_PLUS

INCLUDEPATH += src

#lupdate_only {
#SOURCES += \
#    qml/pages/database/SongPage.qml \
#    qml/pages/database/SearchPage.qml \
#    qml/pages/database/SavedPlaylistsPage.qml \
#    qml/pages/database/PlaylistTracksPage.qml \
#    qml/pages/database/FileBrowserPage.qml \
#    qml/pages/database/CurrentSong.qml \
#    qml/pages/database/CurrentPlaylistPage.qml \
#    qml/pages/database/CurrentPlaylistPage_large.qml \
#    qml/pages/database/ArtistListPage.qml \
#    qml/pages/database/ArtistInformationPage.qml \
#    qml/pages/database/ArtistInfoPage.qml \
#    qml/pages/database/AlbumTracksPage.qml \
#    qml/pages/database/AlbumListPage.qml \
#    qml/pages/database/AlbumInfoPage.qml \
#    qml/pages/settings/SettingsPage.qml \
#    qml/pages/settings/ServerListPage.qml \
#    qml/pages/settings/ServerEditPage.qml \
#    qml/pages/settings/OutputsPage.qml \
#    qml/pages/settings/DatabaseSettings.qml \
#    qml/pages/settings/ConnectServerPage.qml \
#    qml/pages/settings/AboutPage.qml \
#    qml/main.qml \
#    qml/pages/MainPage.qml \
#    qml/components/SpeedScroller.js \
#    qml/components/SectionScroller.js \
#    qml/components/ToggleImage.qml \
#    qml/components/SpeedScroller.qml \
#    qml/components/SongDialog.qml \
#    qml/components/SectionScroller.qml \
#    qml/components/ScrollLabel.qml \
#    qml/components/MainGridItem.qml \
#    qml/components/Heading.qml \
#    qml/components/FileDelegate.qml \
#    qml/components/ControlPanel.qml \
#    qml/components/ArtistDelegate.qml \
#    qml/components/AlbumDelegate.qml \
#    qml/cover/CoverPage.qml \
#    qml/components/AlbumShowDelegate.qml \
#    qml/components/ArtistShowDelegate.qml \
#    qml/pages/settings/GUISettings.qml \
#    qml/components/AlbumListDelegate.qml \
#    qml/components/ArtistListDelegate.qml \
#    qml/pages/database/AddToPlaylistDialog.qml
#}

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

#icon86.files += icons/86x86/harbour-smpc.png
#icon86.path = /usr/share/icons/hicolor/86x86/apps

#icon108.files += icons/108x108/harbour-smpc.png
#icon108.path = /usr/share/icons/hicolor/108x108/apps

#icon128.files += icons/128x128/harbour-smpc.png
#icon128.path = /usr/share/icons/hicolor/128x128/apps

#icon256.files += icons/256x256/harbour-smpc.png
#icon256.path = /usr/share/icons/hicolor/256x256/apps

##iconsvg.files += icons/scalable/harbour-smpc.svgz
##iconsvg.path = /usr/share/icons/hicolor/scalable/apps

#INSTALLS += icon86 icon108 icon128 icon256

