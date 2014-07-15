import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
ApplicationWindow {
    width: 400
    height: 720
    visible: true
    Rectangle {
        color: "#212126"
        anchors.fill: parent
    }
    toolBar: BorderImage {
        border.bottom: 8
        source: "images/selectedrow.png"
        width: parent.width
        height: 100
        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "images/header.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: stackView.pop()
            }
        }

        Text {
            font.pixelSize: 42
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: "Widget Gallery"
        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Buttons"
            page: "fuck.qml"
        }
        ListElement {
            title: "Sliders"
            page: "tableViewDemo.qml"
        }
        ListElement {
            title: "ProgressBar"
            page: "main.qml"
        }
        ListElement {
            title: "Tabs"
            page: "Gradientqml.qml"
        }
        ListElement {
            title: "Rectanle"
            page: "CanvaRectang.qml"
        }
    }
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {
                    text: title
                    onClicked: stackView.push(Qt.resolvedUrl(page))
                }
            }
        }
    }
    Component.onCompleted: {
        stackView.push(Qt.resolvedUrl(pageModel.get(4).page))
    }
}
