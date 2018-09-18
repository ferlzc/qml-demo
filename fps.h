#ifndef FPS_H
#define FPS_H
#include <QObject>
#include <QtQuick/QQuickItem>
#include <QPainter>
#include <QVector>
#include <QDateTime>
#include <QQuickPaintedItem>

class FPSText: public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int fps READ fps NOTIFY fpsChanged)
public:
    FPSText(QQuickItem *parent = 0);
    ~FPSText();
    void paint(QPainter *);
    Q_INVOKABLE int fps()const;

signals:
    void fpsChanged(int);

private:
    void recalculateFPS();
    int _currentFPS;
    int _cacheCount;
    QVector<qint64> _times;
};

#endif // FPS_H
