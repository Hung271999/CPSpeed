using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPSeed.Util
{
    public class Constant
    {
        public const string CONNECTIONSTRING = "connectionString";

        public const int KBN_IMPORT = 11;  //10 : nhap khong co hoa don
        public const int KBN_EXPORT = 21;
        public const int KBN_ORDER = 20;
        public const int KBN_EXPORT_ALL = 30;  //10 : Su dung cho 
        public const int KBN_LIST_ORDER = 99;  //10 : Su dung cho 

        public const int KBN_EXPORT_ADJUST = 29;   // 29 Cho bieu tang , khong phai ban
        public const int KBN_IMPORT_ADJUST = 19;  //19: dieu chinh 

        public const string INVOICE_IMPORT = "HDN";
        public const string INVOICE_EXPORT = "HDX";

        public const string STR_STORE_ALL = "TẤT CẢ KHO";
        public const string STR_DATE = "Ngày {0} Tháng {1} Năm {2}";
        public const string STR_FROM_TO_DATE = "Từ ngày {0} tới {1}";
        public const string STR_KH = "KH";  //KH00001

        public const string STR_ORDER = "Order";
        public const string STR_EXPORT = "Xuất Kho";
        public const string STR_IMPORT = "Nhập Kho";

        public const string DEFAULT_MIN_UNIT = "cai";
        public const int IS_NEED_INVENTORY = 1; // 0 : kieu chu ATM , 1: can check kho 

    }
}
