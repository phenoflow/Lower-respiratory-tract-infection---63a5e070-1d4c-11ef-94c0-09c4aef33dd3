# Victoria Palin, Anna Molter, Miguel Belmonte, Darren M Ashcroft, Andrew White, William Welfare, Tjeerd van Staa, 2024.

import sys, csv, re

codes = [{"code":"H060A00","system":"readv2"},{"code":"H060700","system":"readv2"},{"code":"H300.00","system":"readv2"},{"code":"H060x00","system":"readv2"},{"code":"H060z00","system":"readv2"},{"code":"H060400","system":"readv2"},{"code":"H06z.00","system":"readv2"},{"code":"H302.00","system":"readv2"},{"code":"H30..11","system":"readv2"},{"code":"H30..00","system":"readv2"},{"code":"H060500","system":"readv2"},{"code":"H060600","system":"readv2"},{"code":"H30z.00","system":"readv2"},{"code":"H060.11","system":"readv2"},{"code":"H583200","system":"readv2"},{"code":"H060800","system":"readv2"},{"code":"H060.00","system":"readv2"},{"code":"H060000","system":"readv2"},{"code":"H301.00","system":"readv2"},{"code":"H30..12","system":"readv2"},{"code":"H06..00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('lower-respiratory-tract-infection-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["lower-respiratory-tract-infection-lrti-tracheobronchitis---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["lower-respiratory-tract-infection-lrti-tracheobronchitis---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["lower-respiratory-tract-infection-lrti-tracheobronchitis---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
