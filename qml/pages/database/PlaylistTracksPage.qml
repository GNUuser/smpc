import QtQuick 2.2
import Sailfish.Silica 1.0
import "../../components"

Page {
    id: playlistTracksPage
    allowedOrientations: Orientation.All
    property string playlistname
    property int lastIndex
    SilicaListView {
        id: playlistTracksListView
        model: tracksModel
        quickScrollEnabled: jollaQuickscroll
        SpeedScroller {
            listview: playlistTracksListView
        }
        ScrollDecorator {
        }
        anchors.fill: parent
        contentWidth: width
        clip: true
        header: PageHeader {
            title: playlistname
        }
        populate: Transition {
            NumberAnimation {
                properties: "x"
                from: playlistTracksListView.width * 2
                duration: populateDuration
            }
        }
        PullDownMenu {
            MenuItem {
                text: qsTr("Delete list")
                onClicked: {
                    deleteSavedPlaylistQuestion.playlistname = playlistname
                    pageStack.openDialog(deleteSavedPlaylistQuestion)
                }
            }
            MenuItem {
                text: qsTr("Add list")
                onClicked: {
                    addPlaylist(playlistname)
                }
            }
            MenuItem {
                text: qsTr("Play list")
                onClicked: {
                    playPlaylist(playlistname)
                }
            }
        }

        section {
            delegate: Loader {
                active: sectionsInPlaylist && visible
                height: sectionsInPlaylist ? Theme.itemSizeMedium : 0
                width: parent.width
                sourceComponent: PlaylistSectionDelegate {
                    width: undefined
                }
            }
            property: "section"
        }

        delegate: ListItem {
            menu: contextMenu
            contentHeight: mainColumn.height
            Column {
                id: mainColumn
                height: (trackRow + artistLabel
                         >= Theme.itemSizeSmall ? trackRow + artistLabel : Theme.itemSizeSmall)
                anchors {
                    right: parent.right
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: listPadding
                    rightMargin: listPadding
                }
                Row {
                    id: trackRow
                    Label {
                        text: (index + 1) + ". "
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    Label {
                        clip: true
                        wrapMode: Text.WrapAnywhere
                        elide: Text.ElideRight
                        text: (title === "" ? filename : title)
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    Label {
                        text: (length === 0 ? "" : " (" + lengthformated + ")")
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                }
                Label {
                    id: artistLabel
                    text: (artist !== "" ? artist + " - " : "") + (album !== "" ? album : "")
                    color: Theme.secondaryColor
                    font.pixelSize: Theme.fontSizeSmall
                }
            }
            OpacityRampEffect {
                sourceItem: mainColumn
                slope: 3
                offset: 0.65
            }
            onClicked: {
                playlistTracksListView.currentIndex = index
                albumTrackClicked(title, album, artist, lengthformated, path,
                                  year, tracknr, trackmbid, artistmbid,
                                  albummbid)
            }
            function playTrackRemorse() {
                remorseAction(qsTr("Playing track"), function () {
                    playSong(path)
                }, 3000)
            }
            function addTrackRemorse() {
                remorseAction(qsTr("Adding track"), function () {
                    addSong(path)
                }, 3000)
            }
            function addTrackAfterCurrentRemorse() {
                remorseAction(qsTr("Adding track"), function () {
                    addSongAfterCurrent(path)
                }, 3000)
            }
            function removeFromListRemorse() {
                remorseAction(qsTr("Removing track"), function () {
                    removeSongFromSaved([index, playlistname])
                    savedPlaylistClicked(playlistname)
                }, 3000)
            }
            Component {
                id: contextMenu
                ContextMenu {
                    MenuItem {
                        text: qsTr("Play track")
                        onClicked: {
                            playTrackRemorse()
                        }
                    }

                    MenuItem {
                        text: qsTr("Add track to list")
                        onClicked: {
                            addTrackRemorse()
                        }
                    }
                    MenuItem {
                        text: qsTr("Play after current")
                        onClicked: {
                            addTrackAfterCurrentRemorse()
                        }
                    }
                    MenuItem {
                        text: qsTr("Remove from list")
                        onClicked: {
                            removeFromListRemorse()
                        }
                    }
                }
            }
        }
    }
    Dialog {
        allowedOrientations: Orientation.All
        id: deleteSavedPlaylistQuestion
        property string playlistname
        Column {
            width: parent.width
            spacing: 10
            anchors.margins: Theme.paddingMedium
            DialogHeader {
                acceptText: qsTr("Delete playlist")
            }
            Label {
                text: qsTr("Really delete playlist?")
            }
        }
        onDone: {
            if (result == DialogResult.Accepted) {
                deleteSavedPlaylist(playlistname)
                pageStack.clear()
                pageStack.push(initialPage)
            }
        }
    }

    onStatusChanged: {
        if (status === PageStatus.Deactivating) {
            lastIndex = playlistTracksListView.currentIndex
        } else if (status === PageStatus.Activating) {
            playlistTracksListView.positionViewAtIndex(lastIndex,
                                                       ListView.Center)
        }
    }

    Component.onDestruction: {
        clearPlaylistTracks()
    }
}
