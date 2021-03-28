using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.IO;
using System.Xml.Serialization;
using System.Xml.XPath;

namespace CPSeed.Util
{
    public class Common
    {
        private static log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #region Log4net
        public static log4net.ILog InitLog4Net()
        {
            try
            {
                log4net.Config.XmlConfigurator.Configure();
                logger.Debug("Init log4net completed");

            }
            catch (Exception ex)
            {
                logger.Error(ex);
            }
            return logger;
        }

        #endregion

        public static string GetResouceString(string key)
        {
            try
            {
                return ResourceUtil.Instance.GetString(key);
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        public static int CompareFitness(string individual, string target)
        {
            individual = individual.Replace(" ", string.Empty).Replace("　", string.Empty);
            target = target.Replace(" ", string.Empty).Replace("　",string.Empty);
            int sum = 0, ind_len = individual.Length, tar_len = target.Length;
            for (int i = 0; i < ind_len; i++)
                for(int t=0;t<tar_len;t++)
                    if (individual[i] == target[t]) sum++;
            return sum;
        }
        public static decimal GetDefaultDecimalValue(object value)
        {
            try
            {
                if (value == null || string.IsNullOrEmpty(value.ToString()))
                    return 0m;
                return Convert.ToDecimal(value);
            }
            catch
            {
                return 0m;
            }
        }
        public static Nullable<decimal> GetDecimalValue(string value)
        {
            try
            {
                if (value == "")
                    return null;
                return Convert.ToDecimal(value);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Nullable<double> GetDoubleValue(string value)
        {
            try
            {
                if (value == "")
                    return null;
                return Convert.ToDouble(value);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Nullable<DateTime> GetNullableDateTime(string obj)
        {
            if (obj == null || obj.ToString() == "") return null;
            return Convert.ToDateTime(obj);
        }
        public static double GetDefaultDoubleValue(string value)
        {
            try
            {
                if (string.IsNullOrEmpty(value))
                    return 0d;
                return Convert.ToDouble(value);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       
        public static string GetStringValue(object value)
        {
            try
            {
                if (value == null)
                    return "";
                return value.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Nullable<int> GetIntValue(string value)
        {
            try
            {
                if (value == "")
                    return null;
                return Convert.ToInt32(value);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string GetShortDate(Nullable<DateTime> dt)
        {
            if (dt == null)
                return "";
            else
                return dt.Value.ToString("dd/MM/yyyy");
        }
        public static string GetMoney(decimal? money)
        {
            if (money == null)
                return "0";
            return String.Format("{0:0,00}", money);
        }
        public static string GetAccountKey(string accountID)
        {
            //05248051 - 79b5 - e311 - 989e-d89d67642f34
           if(!string.IsNullOrEmpty(accountID))
            {
                return accountID.Substring(0, 8).ToUpper();
            }
            return null;
        }
        public static string GetDomain(string emailAddress)//@datadesign.co.jp
        {
            //05248051 - 79b5 - e311 - 989e-d89d67642f34
            if (!string.IsNullOrEmpty(emailAddress) && emailAddress.Contains("@"))
            {
                return emailAddress.Split('@')[1];
            }
            return null;
        }
        public static string RemoveUnicode(string text)
        {
            string[] arr1 = new string[] { "á", "à", "ả", "ã", "ạ", "â", "ấ", "ầ", "ẩ", "ẫ", "ậ", "ă", "ắ", "ằ", "ẳ", "ẵ", "ặ",
    "đ",
    "é","è","ẻ","ẽ","ẹ","ê","ế","ề","ể","ễ","ệ",
    "í","ì","ỉ","ĩ","ị",
    "ó","ò","ỏ","õ","ọ","ô","ố","ồ","ổ","ỗ","ộ","ơ","ớ","ờ","ở","ỡ","ợ",
    "ú","ù","ủ","ũ","ụ","ư","ứ","ừ","ử","ữ","ự",
    "ý","ỳ","ỷ","ỹ","ỵ",};
            string[] arr2 = new string[] { "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a",
    "d",
    "e","e","e","e","e","e","e","e","e","e","e",
    "i","i","i","i","i",
    "o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o",
    "u","u","u","u","u","u","u","u","u","u","u",
    "y","y","y","y","y",};
            for (int i = 0; i < arr1.Length; i++)
            {
                text = text.Replace(arr1[i], arr2[i]);
                text = text.Replace(arr1[i].ToUpper(), arr2[i].ToUpper());
            }
            return text;
        }
        public static string str(string chuoi)
        {

            string result = "";
            string a="";
            for (int i = 0; i < chuoi.Length; i++)
            {
                if (chuoi[i] == 'P')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'p');
                }
                if (chuoi[i] == 'A')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'a');
                }
                if (chuoi[i] == 'B')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'b');
                }
                if (chuoi[i] == 'C')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'c');
                }
                if (chuoi[i] == 'D')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'd');
                }
                if (chuoi[i] == 'E')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'e');
                }
                if (chuoi[i] == 'F')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'f');

                }
                if (chuoi[i] == 'G')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'g');
                }
                if (chuoi[i] == 'H')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'h');
                }
                if (chuoi[i] == 'J')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'j');
                }
                if (chuoi[i] == 'K')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'k');
                }
                if (chuoi[i] == 'L')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'l');
                }
                if (chuoi[i] == 'Z')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'z');
                }
                if (chuoi[i] == 'X')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'x');
                }
                if (chuoi[i] == 'Q')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'q');
                }
                if (chuoi[i] == 'M')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'm');
                }
                if (chuoi[i] == 'N')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'n');
                }
                if (chuoi[i] == 'I')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'i');
                }
                if (chuoi[i] == 'O')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'o');
                }
                if (chuoi[i] == 'Y')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'y');
                }
                if (chuoi[i] == 'T')
                {
                    chuoi = chuoi.Replace(chuoi[i], 't');
                }
                if (chuoi[i] == 'R')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'r');
                }
                if (chuoi[i] == 'E')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'e');
                }
                if (chuoi[i] == 'W')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'w');
                }
                if (chuoi[i] == 'V')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'v');
                }
                if (chuoi[i] == 'U')
                {
                    chuoi = chuoi.Replace(chuoi[i], 'u');
                }
                if (chuoi[i] == 'S')
                {
                    chuoi = chuoi.Replace(chuoi[i], 's');
                }
                if (chuoi[i] == '.')
                    continue;
                if (chuoi[i] == ',')
                    continue;
                if (chuoi[i] == ';')
                    continue;
                if (chuoi[i] == ':')
                    continue;
                if (chuoi[i] == '/')
                    continue;
                if (chuoi[i] == '@')
                    continue;
                if (chuoi[i] == '#')
                    continue;
                if (chuoi[i] == '*')
                    continue;
                if (chuoi[i] == '(')
                    continue;
                if (chuoi[i] == ')')
                    continue;
                if (chuoi[i] == '>')
                    continue;
                if (chuoi[i] == '<')
                    continue;
                if (chuoi[i] == ' ')
                {
                    chuoi = chuoi.Replace(chuoi[i], '-');
                    result += chuoi[i];
                }
                else
                    result += chuoi[i];
            }
            
            return RemoveUnicode(result);
        }
        #region AppSetting
        public static string AppSettingKey(string key)
        {
            try
            {
                return ConfigurationManager.AppSettings[key];
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static string GetConnectString()
        {
            try
            {
                return ConfigurationManager.ConnectionStrings[Constant.CONNECTIONSTRING].ConnectionString;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
    public class CodeName
    {
        public string Code { get; set; }
        public string Name { get; set; }

        public string OptionGroup { get; set; }
        public CodeName()
        {
           
        }
        public CodeName(string code, string name)
        {
            Code = code;
            Name = name;
        }
        public CodeName(string code, string name , string group)
        {
            Code = code;
            Name = name;
            OptionGroup = group;
        }

    }
}
