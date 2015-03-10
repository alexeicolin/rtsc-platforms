package platforms.io.outchan;

interface IOutputChannel {
    Void outputStdOut(const Char *buf, Int size);
    Void outputEventLog(const Char *buf, Int size);
}
