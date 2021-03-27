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
