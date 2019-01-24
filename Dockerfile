FROM centos

RUN yum provides '*/applydeltarpm' && \
    yum -y install deltarpm && \
    yum grouplist && \
	  yum -y install gcc gcc-c++ vim wget curl tar bzip2 zip unzip xz make texinfo && \
	  yum -y install kde-l10n-Chinese && \
	  localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
	  rm -rf /var/cache/yum
ENV	LC_ALL zh_CN.UTF-8

RUN mkdir gcc7 && cd gcc7 && \
    wget http://mirror.linux-ia64.org/gnu/gcc/releases/gcc-7.4.0/gcc-7.4.0.tar.xz && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/cloog-0.18.1.tar.gz && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/cloog-parma-0.16.1.tar.gz && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/cloog-ppl-0.15.11.tar.gz && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/gmp-6.1.0.tar.bz2 && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/isl-0.18.tar.bz2 && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/mpc-1.0.3.tar.gz && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/mpfr-3.1.4.tar.bz2 && \
    wget http://mirror.linux-ia64.org/gnu/gcc/infrastructure/ppl-0.11.tar.gz && \
    xz -d gcc-7.4.0.tar.xz && tar -xvf gcc-7.4.0.tar && \
    tar -zxvf cloog-0.18.1.tar.gz && \
    tar -zxvf cloog-parma-0.16.1.tar.gz && \
    tar -zxvf cloog-ppl-0.15.11.tar.gz && \
    tar -jxvf gmp-6.1.0.tar.bz2 && \
    tar -jxvf isl-0.18.tar.bz2 && \
    tar -zxvf mpc-1.0.3.tar.gz && \
    tar -jxvf mpfr-3.1.4.tar.bz2 && \
    tar -zxvf ppl-0.11.tar.gz && \
    cd gcc-7.4.0 && \
    ln -s ../cloog-0.18.1 cloog && \
    ln -s ../cloog-parma-0.16.1 cloog-parma && \
    ln -s ../gmp-6.1.0 gmp && \
    ln -s ../isl-0.18 isl && \
    ln -s ../mpc-1.0.3 mpc && \
    ln -s ../mpfr-3.1.4 mpfr && \
    ln -s ../ppl-0.11 ppl && \
    ./configure --prefix=/usr --enable-checking=release --enable-languages=c,c++ --disable-multilib --enable-host-shared && \
    make -j4 && make install && \
    cd ../../ && rm -rf gcc7
    


    
