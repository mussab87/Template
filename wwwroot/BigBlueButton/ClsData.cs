using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;


namespace bigBlueButtonadmin.bigbluebutton
{
    public class ClsData
    {
        #region "getSha1"        
        /// <summary>
        /// Returns the SHA-1 Value for the InputString
        /// </summary>
        /// <param name="str">InputString</param>
        /// <returns></returns>
        public static string getSha1(string StrValue)
        {
            HashFx md = new HashFx();
            return md.encryptString(StrValue, 1);
        }
        #endregion
    }
}