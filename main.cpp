#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFontDatabase>
#include <QDebug>
#include "fps.h"

int main(int argc, char *argv[])
{
//    qputenv("QSG_INFO", QByteArray("1"));
     #if defined(__arm__) || defined(__TARGET_ARCH_ARM) || defined(_M_ARM) || defined(__aarch64__)
     qputenv("QT_QPA_EGLFS_HIDECURSOR", QByteArray("1"));
     qputenv("QT_QPA_PLATFORM", QByteArray("eglfs"));
     qputenv("QT_QPA_EGLFS_INTEGRATION", QByteArray("eglfs_kms"));
     //qputenv("QT_QPA_EGLFS_FB", QByteArray("/dev/fb0"));
     qputenv("QT_QPA_EGLFS_WIDTH", QByteArray("800"));
     qputenv("QT_QPA_EGLFS_HEIGHT", QByteArray("600"));
     //qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("1"));
     //qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("1"));
     #elif defined(__i386) || defined(__i386__) || defined(_M_IX86)
    #endif


    QQuickStyle::setStyle("Material");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //QQuickWindow::setSceneGraphBackend(QSGRendererInterface::Software);
    qmlRegisterType<FPSText>("FPS", 1, 0, "FPSText");

    QGuiApplication app(argc, argv);
    qDebug() << QFontDatabase::addApplicationFont(":/DejaVuSans.ttf");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
