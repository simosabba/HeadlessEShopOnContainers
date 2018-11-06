using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Headless.Abstractions.Models
{
    public abstract class ContentItem
    {
        [JsonProperty("template")]
        public ContentTemplate Template { get; set; }

        [JsonProperty("data")]
        public Dictionary<string, object> Data { get; set; }
    }
}
