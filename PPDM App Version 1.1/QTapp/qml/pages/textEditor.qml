import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0
import QtQuick.Window 2.11
import "../controls"
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4 as OldControls

Item {
    property string getText: textArea.text
    property string setText: ""

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        CustomButton {
            id: btnLoadCsv
            x: 316
            y: 0
            width: 141
            height: 45
            text: qsTr("Load CSV")
            anchors.left: parent.left
            anchors.leftMargin: 316
            onClicked: {
                backend.textArea(TextArea.text)
            }
        }

        Rectangle {
            id: tableviewarea
            y: 51
            height: 430
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom


        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:800}D{i:3}
}
##^##*/
