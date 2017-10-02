package com.travelexperts.resources;

import com.travelexperts.model.Agent;
import com.travelexperts.services.AgentService;
import org.codehaus.jackson.map.ObjectMapper;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.util.List;


/**
 *
 *      Paths:
 *              /agents
 *                     --> returns all agents
 *
 *              /agents/{agentId}
 *                     --> GET: returns one agent
 *                     --> POST:  create a new agent
 *                     --> PUT: replace agent's info
 *                     --> DELETE: remove an agent
 *
 */

@Path("/agents")
@Produces(MediaType.APPLICATION_JSON)
public class AgentResource {

    private AgentService agentService = new AgentService();

    // return list of all agents
    @GET
    public List<Agent> getAgents() {
        return agentService.getAgents();
    }

    @POST
    @Consumes({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
    public Response addAgent(String agentJson) {

        Agent agent = null;

        try {
            // parse JSON data to agent object
            agent = new ObjectMapper().readValue(agentJson, Agent.class);
            // set id to zero regardless of what's passed (new db entry)
            agent.setAgentId(0);
            // insert into db ... result should not be zero for successful insert
            if (agentService.insertAgent(agent)) {
                return Response.status(200).entity("Agent --> " + agentJson
                        + " --> created.  NOTE: this agentID is invalid").build();
            } else {
                throw new IOException("Cannot create new agent");
            }

        } catch (IOException e) {
            e.printStackTrace();
            return Response.status(500)
                    .entity("There was a problem inserting agent")
                    .build();
        }
    }

    // return a single agent
    @GET
    @Path("/{agentId}")
    public Agent getAgent(@PathParam("agentId") int agentId) {
        return agentService.getAgent(agentId);
    }

    // alter an existing agent record return success/fail
    @PUT
    @Path("/{agentId}")
    @Consumes({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
    public Response updateAgent(@PathParam("agentId") int agentId, String agentJson) {
        // check for empty json
        if (agentJson == null || agentJson =="") {
            return Response.status(400).entity("Please provide an agent").build();
        }

        Agent agent = null;

        try {  // parse JSON data to agent object
            agent = new ObjectMapper().readValue(agentJson, Agent.class);
        } catch (IOException e) {
            e.printStackTrace();
            return Response.status(404)
                    .entity("There was a problem inserting agent")
                    .build();
        }

        // use agentid from pathparam
        agent.setAgentId(agentId);

        // update the database
        if (agentService.updateAgent(agent)) {
            return Response.ok().entity("Agent successfully updated").build();
        } else {
            return Response.status(500)
                    .entity("Something is wrong... agent has not been modified")
                    .build();
        }
    }

    @DELETE
    @Path("/{agentId}")
    public Response deleteAgent(@PathParam("agentId") int agentId) {
        if (agentService.deleteAgent(agentId)) {
            return Response.status(200).entity("Agent successfully deleted").build();
        } else {
            return Response.status(404).entity("delete unsuccessful").build();
        }
    }
}
