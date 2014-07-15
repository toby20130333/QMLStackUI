#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:///fuck.qml")));
    engine.load(QUrl::fromLocalFile(QStringLiteral("stackUI.qml")));

    return app.exec();
}
