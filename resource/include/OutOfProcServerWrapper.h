//******************************************************************
//
// Copyright 2014 Intel Mobile Communications GmbH All Rights Reserved.
//
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#ifndef OC_OUT_OF_PROC_SERVER_WRAPPER_H_
#define OC_OUT_OF_PROC_SERVER_WRAPPER_H_

#include <OCApi.h>

namespace OC
{
    class OutOfProcServerWrapper : public IServerWrapper
    {
    public:
        OutOfProcServerWrapper(PlatformConfig /*cfg*/)
        {}

        virtual OCStackResult stop()
        {
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult start()
        {
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult registerResource(
            OCResourceHandle& /*resourceHandle*/,
            std::string& /*resourceURI*/,
            const std::string& /*resourceTypeName*/,
            const std::string& /*resourceInterface*/,
            EntityHandler& /*entityHandler*/,
            uint8_t /*resourceProperty*/)
        {
            // Not implemented
            return OC_STACK_NOTIMPL;
        }

        // @deprecated: Use setPropertyValue instead.
        OC_DEPRECATED_MSG(
        virtual OCStackResult registerDeviceInfo(
            const OCDeviceInfo /*deviceInfo*/),
            "Use setPropertyValue instead.",
            2017.01)
        {
            // Not implemented
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult registerPlatformInfo(
            const OCPlatformInfo /*deviceInfo*/)
        {
            // Not implemented
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult registerResourceWithHost(
            OCResourceHandle& /*resourceHandle*/,
            std::string& /*resourceHOST*/,
            std::string& /*resourceURI*/,
            const std::string& /*resourceTypeName*/,
            const std::string& /*resourceInterface*/,
            EntityHandler& /*entityHandler*/,
            uint8_t /*resourceProperty*/)
        {
            // Not implemented
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult unregisterResource(
            const OCResourceHandle& /*resourceHandle*/)
        {
            //Not implemented yet
            return OC_STACK_ERROR;
        }

       virtual OCStackResult bindTypeToResource(
           const OCResourceHandle& /*resourceHandle*/,
           const std::string& /*resourceTypeName*/)
        {
            //Not implemented yet
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult bindInterfaceToResource(
            const OCResourceHandle& /*resourceHandle*/,
            const std::string& /*resourceInterfaceName*/)
        {
            //Not implemented yet
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult startPresence(const unsigned int /*seconds*/)
        {
            //Not implemented yet
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult stopPresence()
        {
            //Not implemented yet
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult setDefaultDeviceEntityHandler(
            EntityHandler /*entityHandler*/)
        {
            //Not implemented yet
            return OC_STACK_NOTIMPL;
        }

        virtual OCStackResult sendResponse(
            const std::shared_ptr<OCResourceResponse> /*pResponse*/)
        {
           //Not implemented yet
           return OC_STACK_NOTIMPL;
        }
    };
}

#endif
