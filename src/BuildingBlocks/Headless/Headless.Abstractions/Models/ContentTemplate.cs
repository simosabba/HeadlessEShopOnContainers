using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Headless.Abstractions.Models
{
    public class ContentTemplate
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }
    }
}
