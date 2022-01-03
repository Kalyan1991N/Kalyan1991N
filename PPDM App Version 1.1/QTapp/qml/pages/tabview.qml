import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Item{

    TableView {
        id: tableView
        height: 430

        columnWidthProvider: function (column) { return 100; }
        rowHeightProvider: function (column) { return 60; }
        anchors.fill: parent
        clip: true
        leftMargin: rowsHeader.implicitWidth
        topMargin: columnsHeader.implicitHeight
        model: table_model
        delegate: Rectangle {
            color: parseFloat(display) > 100 ? 'red' : 'green'
            Text {
                text: display
                anchors.fill: parent
                anchors.margins: 10
                color: '#ffffff'
                font.pixelSize: 10
                verticalAlignment: Text.AlignVCenter
            }
        }
        Rectangle { // mask the headers
            z: 1
            color: "#222222"
            y: tableView.contentY
            x: tableView.contentX
            width: tableView.leftMargin
            height: tableView.topMargin
        }

        Row {
            id: columnsHeader
            y: tableView.contentY
            z: 1
            Repeater {
                model: tableView.columns > 0 ? tableView.columns : 1
                Label {
                    width: tableView.columnWidthProvider(modelData)
                    height: 35
                    text: table_model.headerData(modelData, Qt.Horizontal)
                    color: '#aaaaaa'
                    font.pixelSize: 15
                    padding: 10
                    verticalAlignment: Text.AlignVCenter

                    background: Rectangle { color: "#333333" }
                }
            }
        }
        Column {
            id: rowsHeader
            x: tableView.contentX
            z: 1
            Repeater {
                model: tableView.rows > 0 ? tableView.rows : 1
                Label {
                    width: 40
                    height: tableView.rowHeightProvider(modelData)
                    text: table_model.headerData(modelData, Qt.Vertical)
                    color: '#aaaaaa'
                    font.pixelSize: 15
                    padding: 10
                    verticalAlignment: Text.AlignVCenter

                    background: Rectangle { color: "#333333" }
                }
            }
        }

        ScrollIndicator.horizontal: ScrollIndicator { }
        ScrollIndicator.vertical: ScrollIndicator { }
    }
    Connections{
        target: backend
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
