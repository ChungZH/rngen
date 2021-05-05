import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

import Backend 1.0

Window {
    width: 250
    height: 350
    visible: true
    title: "抽学号机"
    color: Material.backgroundColor

    Column {
        anchors.centerIn: parent
        anchors.margins: 5
        spacing: 20

        Grid {
            columns: 2
            spacing: 10
            verticalItemAlignment: Grid.AlignVCenter

            Text {
                id: from
                text: qsTr("起点")
                font.pointSize: 17
                color: Material.primaryTextColor
            }
            SpinBox {
                id: startBox
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                editable: true
                from: 0
                to: 100
                value: 1
                font.pointSize: 13
                width: 150
            }

            Text {
                id: to
                text: qsTr("终点")
                font.pointSize: 17
                color: Material.primaryTextColor
            }
            SpinBox {
                id: endBox
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                editable: true
                from: 1
                to: 100
                value: 42
                font.pointSize: 13
                width: 150
            }
        }

        Button {
            text: "抽学号"
            font.pointSize: 15
            width: parent.width
            highlighted: true
            Material.accent: Material.Orange

            onClicked: {
                if (endBox.value > startBox.value) {
                    backend.genNumber(startBox.value, endBox.value)
                } else {
                    popup.open()
                }
            }
        }

        Text {
            id: numberText
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "?"
            color: "#333333"
            font.pointSize: 50
        }

        Text {
            text: "v0.1.0.210505_release"
            color: Material.hintTextColor
            width: parent.width
            horizontalAlignment: Text.AlignRight
            font.pointSize: 10
            font.italic: true
        }

        Popup {
            id: popup
            modal: true
            contentItem: Label {
                text: "不对劲..."
            }
            anchors.centerIn: Overlay.overlay
        }
    }

    Backend {
        id: backend
        onNumberChanged: numberText.text = number
    }
}
