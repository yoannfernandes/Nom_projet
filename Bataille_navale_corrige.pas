program Bataille_Navale;

uses crt;

CONST
	NB_BATEAUX=2;   
	MAX_CASE=5;   
	MIN_L=1;
	MAX_L=50;
	MIN_C=1;
	MAX_C=50; 

TYPE 	
	cellule=record
		ligne:integer;
		colonne:integer;
end;

TYPE 
	bateau=record
		nCase:array[1..MAX_CASE] of cellule; 
end; 

TYPE 
	flotte=record
		nBateaux:array[1..NB_BATEAUX] of bateau;
end;

TYPE Bool=(vrai,faux);

TYPE posBateau=(ligne,colonne,diagonale);

TYPE etatBateau=(touche,coule);	

TYPE etatFlotte=(a_Flot,sombrer);

TYPE etatJoueur=(gagne,perdu);

PROCEDURE creaCellule(ligne,colonne:integer; VAR nCel: cellule);
	begin
		nCel.ligne:=ligne;
		nCel.colonne:=colonne;
end; 	

FUNCTION cmpCellule(ncel,tcel:cellule):boolean;
	begin
		IF ((ncel.ligne=tcel.ligne) AND (ncel.colonne=tcel.colonne)) THEN
			cmpCellule:=TRUE
		ELSE
			cmpCellule:=FALSE;
	end;			

FUNCTION creatBateau(ncel:cellule;taille:integer):bateau;
	VAR
		tmpBateau:bateau;
		pos:integer;
		i:integer;
		pBateau:posBateau;
	BEGIN	
		randomize;
		pos:=random(2)+1;
		pBateau:=posBateau(pos);
		FOR i:=1 TO MAX_CASE DO
			IF (i<=taille) THEN
				tmpBateau.ncel[i].ligne:=ncel.ligne;
				tmpBateau.ncel[i].colonne:=ncel.colonne
			ELSE
				tmpBateau.ncel[i].ligne:=0
				tmpBateau.ncel[i].colonne:=0
			end;		

			IF pBateau=enLigne THEN
				ncel.col:=ncel.col+1
			ELSE 
				IF pBateau=enColonne THEN
					ncel.ligne:=ncel.ligne+1
				ELSE 
					IF pBateau=enDiagonal THEN
						ncel.ligne:=ncel.ligne+1
						ncel.colonne:=ncel.colonne+1
					end;
				end;
			end;
		end;	
		creatBateau:=tmpBateau
	end;	

	FUNCTION verifCellule(nBat:bateau;nCel:Cellule):boolean;
		VAR
			i:integer;
			test:Boolean;
		begin			
			teste:=FALSE;
			FOR i:=1 to MAX_CASE DO
			 	IF cmpCellule (nBateaux.nCel[i],nCel)=TRUE THEN
                    test:=TRUE;
                end;
            end;
        verifCellule:=test
    end;


	FUNCTION verifFlotte(f:flotte;ncel:Cellule):boolean;
		VAR
			i:integer;
			test:boolean;
		begin
			teste:=FALSE;
			FOR i:=1 TO NB_BATEAUX DO
				IF verifCellule(f.nBateaux[i],ncel)=TRUE THEN
					test:=TRUE;
				end; 
				verifFlotte:=test;
			end;			
	end;
	
	PROCEDURE flotte_joueur(VAR nCell:cellule;VAR f:flotte);
		VAR
			i,valposligne,valposcolonne,valtaillebateau:integer;	
		begin
			FOR i:=1 to NB_BATEAUX DO
				begin
					randomize;
					valposligne:=random(1..MAX_L);
					valposcolonne:=random(1..MAX_C);
					valtaillebateau:=random(1..MAX_CELLULE);
					creaCellule(valposligne,valposcolonne,ncell);
					f.nBateaux[i]:=creatBateau(ncell,valtaillebateau);
				end;
			end;
	end;

BEGIN
clrscr;
writeln('partie de Bataille Navale');





readln;
END.