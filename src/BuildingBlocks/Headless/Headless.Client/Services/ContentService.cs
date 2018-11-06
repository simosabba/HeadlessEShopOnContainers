using Headless.Abstractions;
using Headless.Abstractions.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Headless.Client.Services
{
    public class ContentService : IContentService
    {
        private readonly IContentManager _contentManager;

        public ContentService(IContentManager contentManager)
        {
            _contentManager = contentManager ?? throw new ArgumentException(nameof(IContentManager));
        }

        public ContentItem GetContent(string id, CultureInfo culture)
        {
            return _contentManager.GetContentItem(id, culture);
        }
    }
}
