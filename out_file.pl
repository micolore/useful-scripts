#!/usr/bin/perl
# 脚本功能: 选择指定文件夹，把该文件夹目录下面的指定格式的文件内容，输出到一个文件里面。（软著汇总代码，审核使用）

# 定义输出目标文件
open(DATA_NEW,"+>>code.txt") || die "code.txt 文件无法打开, $!";

# 扫描文件处理
sub scan_file{
    my @files = glob(@_[0]);
    foreach (@files){
        if(-d $_ && $_ !~ "node_modules"){
            my $path = "$_/*";
            scan_file($path);
        }elsif(-f $_ && $_ =~ ".md"){
                open(DATA, "<$_") or die "$_ 文件无法打开, $!";
                while(<DATA>){
                     print DATA_NEW $_;
                }
                close(DATA);
        }
    }
}
scan_file("C:\\moppo\\kubrick\\doc\\wa-scrm-docs");
