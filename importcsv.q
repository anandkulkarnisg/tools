.csv.importCsvFile:
	{[]
		unitTestResults: ("ISSSSS"; enlist "|") 0:`valgrind.csv;
		unitTestResults:update heap_summary:{ { `$ ssr[string x;"^";"\n"] } each x }[heap_summary] from unitTestResults;
		unitTestResults:update leak_summary:{ { `$ ssr[string x;"^";"\n"] } each x }[leak_summary] from unitTestResults;
		unitTestResults:update error_summary:{ { `$ ssr[string x;"^";"\n"] } each x }[error_summary] from unitTestResults;
		unitTestResults
	}



.csv.showResults:
    {[]
        failedTestNames:raze exec { { raze (string x, " , ")} each x }[filename]  from unitTestResults where status=`Y;
        $[count failedTestNames;
            [
                failedTestNames:failedTestNames[til (count failedTestNames)-3];
                resultString:raze("The failed tests are = " ; failedTestNames);           
				resultString 
            ];"None"
         ]
    }

\c 25 200

cmdopts:.Q.opt .z.x;
unitTestResults:.csv.importCsvFile[];
.csv.showResults[]
quit:lower first cmdopts[`exit];
quit:quit[0];
$[quit="y";system"\\";0N!"in q prompt now at port 5000. Please check the unitTestResults table for results"]
