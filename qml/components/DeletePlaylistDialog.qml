import QtQuick 2.2
import Sailfish.Silica 1.0

Dialog {
    allowedOrientations: Orientation.All
    Column {
        width: parent.width
        spacing: Theme.paddingMedium
        anchors.margins: Theme.paddingMedium
        DialogHeader {
            acceptText: qsTr("Delete playlist")
        }
        Label {
            text: qsTr("Really delete playlist?")
        }
    }
    onDone: {
        if (result === DialogResult.Accepted) {
            deletePlaylist()
        }
    }
}
