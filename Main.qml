import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: backgroundRectangle
    width: 1920/3
    height: 1080

    Rectangle {
        id: specialCardsRectangle
        width: backgroundRectangle.width/5
        color: "#f5caca"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }

    Rectangle {
        id: scoreRectangle
        x: 4
        width: backgroundRectangle.width/5
        color: "#c79999"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
    }

    Rectangle {
        id: enemyFieldRectangle
        color: "#ff8f8f"
        anchors.left: specialCardsRectangle.right
        anchors.right: scoreRectangle.left
        anchors.top: parent.top
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }

    Rectangle {
        id: myFieldRectangle
        color: "#ac8686"
        anchors.left: specialCardsRectangle.right
        anchors.right: scoreRectangle.left
        anchors.top: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        function moveCardFromMyHandToField(imageName)
        {
            for(var i=0; i<myHandListModel.count; ++i)
            {
                if (imageName === myHandListModel.get(i).name)
                {
                    myHandListModel.remove(i)
                    if (imageName.includes("spades")) mySpadesListModel.append({name: imageName})
                    if (imageName.includes("diamonds")) myDiamondsListModel.append({name: imageName})
                    if (imageName.includes("clubs")) myClubsListModel.append({name: imageName})
                }
            }
        }

        Rectangle {
            id: myHandRectangle
            height: myFieldRectangle.height/4
            color: "#86ae86"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Row {
                id: myHandRow
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                ListModel{
                    id: myHandListModel
                    ListElement{name: "images/2_of_clubs.png"}
                    ListElement{name: "images/10_of_diamonds.png"}
                    ListElement{name: "images/king_of_spades.png"}
                    ListElement{name: "images/8_of_clubs.png"}
                    ListElement{name: "images/jack_of_diamonds.png"}
                }

                Repeater {
                    id: myHandRepeater
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    model: myHandListModel

                    Image {
                        id: myHandImage
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 20
                        anchors.bottomMargin: 20
                        fillMode: Image.PreserveAspectFit
                        source: name

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            onClicked: myFieldRectangle.moveCardFromMyHandToField(name)
                        }


                    }
                }
            }
        }

        Rectangle {
            id: myClubsRectangle
            y: 7
            height: myFieldRectangle.height/4
            color: "#c1f9c1"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: myHandRectangle.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0

            Row {
                id: myClubsRow
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                ListModel{
                    id: myClubsListModel
                }

                Repeater {
                    id: myClubsRepeater
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    model: myClubsListModel

                    Image {
                        id: myClubsImage
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 20
                        anchors.bottomMargin: 20
                        fillMode: Image.PreserveAspectFit
                        source: name
                    }
                }
            }
        }

        Rectangle {
            id: myDiamondsRectangle
            y: 4
            height: myFieldRectangle.height/4
            color: "#75a975"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: myClubsRectangle.top
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Row {
                id: myDiamondsRow
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                ListModel{
                    id: myDiamondsListModel
                }

                Repeater {
                    id: myDiamondsRepeater
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    model: myDiamondsListModel

                    Image {
                        id: myDiamondsImage
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 20
                        anchors.bottomMargin: 20
                        fillMode: Image.PreserveAspectFit
                        source: name
                    }
                }
            }
        }

        Rectangle {
            id: mySpadesRectangle
            color: "#b7e6b7"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: myDiamondsRectangle.top
            anchors.bottomMargin: 0

            Row {
                id: mySpadesRow
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                ListModel{
                    id: mySpadesListModel
                }

                Repeater {
                    id: mySpadesRepeater
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    model: mySpadesListModel

                    Image {
                        id: mySpadesImage
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 20
                        anchors.bottomMargin: 20
                        fillMode: Image.PreserveAspectFit
                        source: name
                    }
                }
            }
        }

    }
}
