argDict:.Q.opt .z.x;
startPort:first "J"$argDict[`startPort];
iterations:first "J"$argDict[`iterations];
handleList:{ hopen x } each { value raze ("`::"; string x) } each startPort + til iterations;
resultList:{ neg[x](y); neg[x][]; }[;"\\\\"] each handleList;
\\
