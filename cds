#!/usr/bin/python3

import os

def main ():

    if 'up' in case_input.lower():
        print('uploading...\n')
        cds_upload()

    else:
        print('downloading...\n')
        cds_download()



def cds_download():

    date_input = input("date in mmm_dd or mmm dd:").lower().strip()

    if '_' in date_input:
        mod_date_input = date_input
    elif ' ' in date_input:
        mod_date_input = date_input.replace(' ', '_')
    else:
        mod_date_input = date_input[:3] + '_' + date_input[3:]


    main_dir_list = os.listdir(main_dir)

    if case_input in main_dir_list:
        print ("'%s' already exist!\n" %dir)
    else:
        os.mkdir(dir)
        print ("'%s' case folder created\n" %dir)

    download_path = 'scp blow@quantum.es.f5net.com:"/olympus/shares/cds/global/%s/INCOMING/%s/*" %s/' %(case_input, mod_date_input, dir)

    print(download_path)


def cds_upload():

    if case_input[0] == 'C':
        mod_case_input = case_input[0:8]
    else:
        mod_case_input = case_input.lower().translate({ord(i): None for i in 'abcdefghijklmnopqrstuvwxyz'}).replace(' ','')

    print ('Case number: %s' % mod_case_input)

    count = 0

    for i in os.listdir(main_dir):

        if mod_case_input in i:
            count += 1
            mod_dir = os.path.join(main_dir, i)
            print('\nFiles in %s: ' % mod_dir)

            for j in (os.listdir(mod_dir)):
                print(j, end='\n')

            input_filename = input('\nCopy & paste filename: ').strip()
            upload_path = 'scp %s/%s blow@quantum.es.f5net.com:"/olympus/shares/cds/global/%s/OUTGOING/"'%(mod_dir, input_filename, mod_case_input)
            print(upload_path)


    if count == 0:
        print('Case folder not found in %s' % main_dir)
        print('scp /Users/b.low/<file> blow@quantum.es.f5net.com:"/olympus/shares/cds/global/%s/OUTGOING/"'%(mod_case_input))


if __name__ == '__main__':

    case_input = input("Enter case number: ").strip()
    main_dir = "/Users/b.low/Downloads/cases/"
    dir = os.path.join(main_dir, case_input)

    main ()
