using Headless.Abstractions;
using Headless.Abstractions.Models;
using Headless.Client.Settings;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Headless.Client.Services
{
    internal class ContentManagerClient : IContentManager
    {
        private readonly ContentServiceOptions _options;

        public ContentManagerClient(ContentServiceOptions options)
        {
            _options = options ?? throw new ArgumentNullException();
        }

        public ContentItem GetContentItem(string id, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
