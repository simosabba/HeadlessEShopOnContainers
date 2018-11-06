using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Headless.Abstractions.Models
{
    public class Culture
    {
        public Culture()
        { }

        public Culture(CultureInfo culture)
        {
            Id = culture.LCID.ToString();
            Code = culture.Name;
            DisplayName = culture.DisplayName;
        }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("code")]
        public string Code { get; set; }

        [JsonProperty("displayName")]
        public string DisplayName { get; set; }
    }
}
