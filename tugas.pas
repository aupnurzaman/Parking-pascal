program parkir;
uses crt;
type
        data=record
                an:string;
                nopol:longint;
                jm,mm,jk,mk:integer;
                end;
type
        harga=record
                mtr,mbl,trk:integer;
                end;
var
        hrg:array [1..3] of harga;
        iden:data;
        id:file of data;
        ketemu:boolean;
        lagi,ya:char;
	p,nm,pass,dtpas,dtnm:string;
        x,a,jenis,i,no:integer;
	c,tot:longint;

procedure tampil;
begin
clrscr;
assign(id, 'tugas.txt');
reset(id);
while not  EOF (id) do
begin
 read(id, iden);
 writeln('                                   ----------------------------------------------');
 writeln('                                        Atas Nama            : ',iden.an);
 writeln('                                        No Polisi            : ',iden.nopol);
 writeln('                                        kendaraan Masuk jam  : ',iden.jm,':',iden.mm);
 writeln('                                        kendaraan keluar jam : ',iden.jk,':',iden.mk);
 writeln('                                   ----------------------------------------------');
end;
readln;
close(id);
end;

procedure cari;
begin
assign(id,'tugas.txt');
reset(id);
tot:= filesize(id);
lagi:='y';
while upcase(lagi)='Y' do
begin
clrscr;
ketemu:= false;
gotoxy(40,6);write('Masukan No Polisi yang di Cari : ');
readln(no);
writeln;
 for i:= 1 to tot do
 begin
 seek(id,i-1);
 read(id,iden);
  if iden.nopol=no then
  begin
  ketemu:= true;
  writeln('                                   ',i,')');
  writeln('                                   ----------------------------------------------');
  writeln('                                        Atas Nama            : ',iden.an);
  writeln('                                        No Polisi            : ',iden.nopol);
  writeln('                                        kendaraan Masuk jam  : ',iden.jm,':',iden.mm);
  writeln('                                        kendaraan keluar jam : ',iden.jk,':',iden.mk);
  writeln('                                   ----------------------------------------------');
  end;
 end;
  if not ketemu then
  writeln('                                         No Polisi tidak di temukan!!!');
  writeln;
  write('                                          Cari Lagi [Y/T or Enter] ? ');
  readln(lagi);
 end;
close(id);
end;

procedure hapus;
begin
assign(id,'tugas.txt');
reset(id);
lagi:= 'Y';
while upcase(lagi)='Y' do
begin
clrscr;
tot:= filesize(id);
write('                                          Nomor data yang di Hapus (1  -',tot,') ? ');
readln(no);
writeln;
      if (no < 1) or (no > no) then
        writeln('                                            Tidak ditemukan !!!')
      else
        begin
        for i:= no to tot do
        begin
        seek(id,i-1);
        read(id,iden);
        with iden do
        begin
        writeln('                                   ----------------------------------------------');
        writeln('                                        Atas Nama            : ',iden.an);
        writeln('                                        No Polisi            : ',iden.nopol);
        writeln('                                        kendaraan Masuk jam  : ',iden.jm,':',iden.mm);
        writeln('                                        kendaraan keluar jam : ',iden.jk,':',iden.mk);
        writeln('                                   ----------------------------------------------');
        end;
        end;
        write('                                        Yakin Data ini Akan di Hapus [Y/T] ? '); readln(ya);
         if upcase(ya) = 'Y' then
         begin
         seek(id,no-1);
         truncate(id);
         end;
        end;
        writeln;

        write('                                        Ada lagi yang akan dihapus [Y/T or Enter] ? '); readln(lagi);
        end;
close(id);
end;

procedure edit;
begin
repeat
clrscr;
gotoxy(40,6);writeln('--------------------------');
gotoxy(40,7);writeln('Pilih untuk mengubah harga');
gotoxy(40,8);writeln('--------------------------');
gotoxy(40,9);writeln('1. Harga perjam Motor');
gotoxy(40,10);writeln('2. Harga perjam Mobil');
gotoxy(40,11);writeln('3. Harga perjam Truck');
gotoxy(40,12);writeln('4. Batal');
gotoxy(41,14);write('Masukan Pilihan '); readln(x);
       if x=1 then
        begin
        write('                                        Masukan Harga baru :'); readln(a);
        hrg[1].mtr:=a;
        writeln('                                        Berhasil di ubah ');
        readln;
        end;
       if x=2 then
        begin
        write('                                        Masukan Harga baru :'); readln(a);
        hrg[2].mbl:=a;
        writeln('                                        Berhasil di ubah');
        readln;
        end;
       if x=3 then
        begin
        write('                                        Masukan Harga baru :'); readln(a);
        hrg[3].trk:=a;
        writeln('                                        Berhasil di ubah');
        readln;
        end;
until x=4;
end;

procedure mobil(c:integer);
var
	jum:longint;
begin
        if c=0 then
        jum:=3000
        else
	jum:=((c-1)*hrg[2].mbl)+3000;
        begin
        gotoxy(40,18);writeln('  Total Pembayaran      : Rp.',jum);
        gotoxy(40,19);writeln('|                                             |');
        gotoxy(40,20);writeln('|*******TERIMA KASIH ATAS KUNJUNGANNYA********|');
        gotoxy(40,21);writeln('|_____________________________________________|');
	readln;
        end;
end;

procedure motor(c:integer);
var
	jum:longint;
begin
        if c=0 then
        jum:=2000
        else
	jum:=((c-1)*hrg[1].mtr)+2000;
        begin
        gotoxy(40,18);writeln('  Total Pembayaran      : Rp.',jum);
        gotoxy(40,19);writeln('|                                             |');
        gotoxy(40,20);writeln('|*******TERIMA KASIH ATAS KUNJUNGANNYA********|');
        gotoxy(40,21);writeln('|_____________________________________________|');
	readln;
        end;
end;

procedure truck(c:integer);
var
	jum:longint;
begin
        if c=0 then
        jum:=5000
        else
	jum:=((c-1)*hrg[3].trk)+5000;
        begin
        gotoxy(40,18);writeln('  Total Pembayaran      : Rp.',jum);
        gotoxy(40,19);writeln('|                                             |');
        gotoxy(40,20);writeln('|*******TERIMA KASIH ATAS KUNJUNGANNYA********|');
        gotoxy(40,21);writeln('|_____________________________________________|');
	readln;
        end;
end;

procedure admin;
begin
        clrscr;
        gotoxy(55,5);writeln('LOGIN ADMIN');
        gotoxy(40,6);writeln('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
        gotoxy(40,7);writeln('|                                     |');
        gotoxy(40,8);write('  Nama     : '); readln(nm);
        gotoxy(40,9);write('  Password : '); readln(pass);
        gotoxy(40,10);writeln('|                                     |');
        gotoxy(40,11);writeln('|$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$|');
        dtnm:='admin';
        dtpas:='admin';
                if (dtnm=nm) and (dtpas=pass) then
                begin
                    repeat
                    clrscr;
                    gotoxy(55,5);writeln('MENU ADMIN');
                    gotoxy(40,6);writeln('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
                    gotoxy(40,7);writeln('|                                     |');
                    gotoxy(40,8);writeln('|   1. Lihat pengunjung yang parkir   |');
                    gotoxy(40,9);writeln('|   2. Cari                           |');
                    gotoxy(40,10);writeln('|   3. Cari Nomor Polisi dan hapus    |');
                    gotoxy(40,11);writeln('|   4. Ubah harga                     |');
                    gotoxy(40,12);writeln('|   5. LogOut                         |');
                    gotoxy(40,13);writeln('|                                     |');
                    gotoxy(40,14);writeln('|                                     |');
                    gotoxy(40,15);writeln('|$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$|');
                    gotoxy(47,16);write('Masukan pilihan :'); readln(x);
                    if x=1 then
                        begin
                         tampil;
                        end;
                    if x=2 then
                        begin
                         cari;
                        end;
                    if x=3 then
                        begin
                         hapus;
                        end;
                    if x=4 then
                        begin
                         edit;
                        end;

until x=5;
end;
end;

procedure user;
begin
 assign(id, 'tugas.txt');
 rewrite(id);
        repeat
        clrscr;
        gotoxy(40,6);writeln('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
        gotoxy(40,7);write(' Atas Nama: '); readln(iden.an);
        gotoxy(40,8);write(' No Polisi: '); readln(iden.nopol);
        gotoxy(40,9);writeln(' jenis kendaraan : 1.Motor');
        gotoxy(40,10);writeln('                   2.Mobil');
        gotoxy(40,11);writeln('                   3.Truck');
        gotoxy(40,12);write('    '); read(jenis);
        gotoxy(40,13);write(' Jam masuk   : '); read(iden.jm);
        gotoxy(40,14);write(' menit masuk : '); read(iden.mm);
        gotoxy(40,15);write(' Jam keluar  : '); read(iden.jk);
        gotoxy(40,16);write(' menit keluar: '); read(iden.mk);
        gotoxy(40,17);writeln('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
begin
        clrscr;
        gotoxy(40,6);writeln(' _____________________________________________');
        gotoxy(40,7);writeln('|                                             |');
        gotoxy(40,8);writeln('|******************LDA PARKING****************|');
        gotoxy(40,9);writeln('|                                             |');
        gotoxy(40,10);writeln('  Atas Nama kendaraan   : ',iden.an);
        gotoxy(40,11);writeln('  No Polisi Kendaraan   : ',iden.nopol);
        if jenis=1 then
        writeln('                                         Jenis Kendaraan       : Motor');
        if jenis=2 then
        writeln('                                         Jenis Kendaraan       : Mobil');
        if jenis=3 then
        writeln('                                         Jenis Kendaraan       : Truck');
        gotoxy(40,13);writeln('  Jam Masuk Kendaraan   : ',iden.jm,':',iden.mm);
        gotoxy(40,14);writeln('  Jam Keluar Kendaraan  : ',iden.jk,':',iden.mk);
        write(id,iden);
        iden.jm:=iden.jm*60;
        iden.mm:=iden.mm+iden.jm;
        iden.jk:=iden.jk*60;
        iden.mk:=iden.mk+iden.jk;

         if (iden.mk<iden.mm) then
          iden.mk:=iden.mk+720;

        tot:=iden.mk-iden.mm;
        c:=(tot div 60);
        gotoxy(40,15);writeln('  Lama Parkir           : ',c,' jam');
        begin
                if (jenis=1) then
                motor(c);
        end;
        begin
                if (jenis=2) then
                mobil(c);
        end;
        begin
                if (jenis=3) then
                truck(c);
        end;
        end;
        gotoxy(40,22);write('Press (x) for cancel And Enter for continue '); readln(p);
        until(p ='x' );
 close(id);
end;

procedure menu1;
begin
        repeat
        clrscr;
        gotoxy(39,4);writeln('--------HALLO SELAMAT DATANG--------');
        gotoxy(39,5);writeln('----------APLIKASI PARKIR-----------');
        gotoxy(40,6);writeln('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'); delay(800);
        gotoxy(40,7);writeln('|                                |'); delay(200);
        gotoxy(40,8);writeln('| Masuk Sebagai :                |'); delay(300);
        gotoxy(40,9);writeln('|   1. User                      |'); delay(300);
        gotoxy(40,10);writeln('|   2. Admin                     |'); delay(300);
        gotoxy(40,11);writeln('|                                |'); delay(200);
        gotoxy(40,12);writeln('|$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$|'); delay(800);
        gotoxy(41,13);write('Press 1 & 2 or 0 for Exit ');readln(x);

        if (x=1) then
        begin
          user
        end;
        if (x=2) then
        begin
          admin;
        end;
        i:=i+1;
until x=0;
end;

begin
menu1;
end.



