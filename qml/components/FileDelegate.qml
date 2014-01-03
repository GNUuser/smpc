import QtQuick 2.0
import Sailfish.Silica 1.0

Component {
    ListItem {
        menu: contextMenu
        id: filesDelegate
        property int workaroundHeight: fileicon.height
        height: workaroundHeight
        Image {
            height: (filenametext.height + trackLabel
                     >= Theme.itemSizeSmall ? filenametext.height
                                              + trackLabel : Theme.itemSizeSmall)
            anchors {
                leftMargin: listPadding
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            id: fileicon
            source: (isDirectory ? "image://theme/icon-m-folder" : (isPlaylist ? "image://theme/icon-m-document" : "image://theme/icon-m-music"))
            width: height
        }
        Label {
            id: filenametext
            text: name
            wrapMode: "NoWrap"
            elide: Text.ElideMiddle
            anchors {
                verticalCenter: isFile ? undefined : parent.verticalCenter
                top: isFile ? parent.top : undefined
                left: fileicon.right
                right:parent.right
                rightMargin: listPadding
            }
        }
        Label {
            id: trackLabel
            visible: isFile
            text: (!isFile ? "" : (title === "" ? "" : title + " - ")
                             + (artist === "" ? "" : artist))
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.secondaryColor
            anchors {
                top: filenametext.bottom
                left: fileicon.right
                right:parent.right
                rightMargin: listPadding
            }
        }
        OpacityRampEffect {
            sourceItem: filenametext
            slope: 3
            offset: 0.65
        }
        OpacityRampEffect {
            sourceItem: trackLabel
            slope: 3
            offset: 0.65
        }
        onClicked: {
            if (isDirectory) {
                lastContentPosY = index
                filesClicked((prepath == "/" ? "" : prepath + "/") + name)
            }
            if (isFile) {
                console.debug("Album:" + album)
                albumTrackClicked(title, album, artist, length, path,
                                  year, tracknr)
            }
            if (isPlaylist) {
                console.debug(
                            "Playlist:" + (prepath == "/" ? "" : prepath + "/") + name)
                savedPlaylistClicked(
                            (prepath == "/" ? "" : prepath + "/") + name)
            }
        }

        function addTrackRemorse() {
            remorseAction(qsTr("adding track"), function () {
                addSong(path)
            }, 3000)
        }
        function addPlaylistRemorse() {
            remorseAction(qsTr("adding playlist"), function () {
                console.debug(
                            "playlist: " + (prepath == "/" ? "" : prepath + "/")
                            + name + " requested")
                addPlaylist((prepath == "/" ? "" : prepath + "/") + name)
            }, 3000)
        }
        function addFolderRemorse() {
            remorseAction(qsTr("adding directory"), function () {
                addFiles((prepath == "/" ? "" : prepath + "/") + name)
            }, 3000)
        }
        function playTrackRemorse() {
            remorseAction(qsTr("playing track"), function () {
                playSong(path)
            }, 3000)
        }
        function playPlaylistRemorse() {
            remorseAction(qsTr("playing playlist"), function () {
                playPlaylist((prepath == "/" ? "" : prepath + "/") + name)
            }, 3000)
        }
        function playFolderRemorse() {
            remorseAction(qsTr("playing directory"), function () {
                playFiles((prepath == "/" ? "" : prepath + "/") + name)
            }, 3000)
        }
        Component {
            id: contextMenu
            ContextMenu {
                MenuItem {
                    text: isFile ? qsTr(
                                       "play file") : (isDirectory ? qsTr("play directory") : qsTr(
                                                                         "play playlist"))
                    onClicked: {
                        if (isFile) {
                            playTrackRemorse()
                        } else if (isDirectory) {
                            playFolderRemorse()
                        } else if (isPlaylist) {
                            playPlaylistRemorse()
                        }
                    }
                }

                MenuItem {
                    text: isFile ? qsTr(
                                       "add file") : (isDirectory ? qsTr("add directory") : qsTr(
                                                                        "add playlist"))
                    onClicked: {
                        if (isFile) {
                            addTrackRemorse()
                        } else if (isDirectory) {
                            addFolderRemorse()
                        } else if (isPlaylist) {
                            addPlaylistRemorse()
                        }
                    }
                }
                onHeightChanged: {
                    workaroundHeight = height + fileicon.height
                }
            }
        }
    }
}
