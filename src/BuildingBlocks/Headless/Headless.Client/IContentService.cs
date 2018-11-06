using Headless.Abstractions.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Headless.Client
{
    public interface IContentService
    {
        ContentItem GetContent(string id, CultureInfo culture);
    }
}
